import { Controller, Get, Post, Body, Param, UseGuards } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { CommandService } from './command.service';

@Controller('command')
@UseGuards(AuthGuard('jwt'))
export class CommandController {
  constructor(private commandService: CommandService) {}

  @Post(':deviceId')
  sendCommand(
    @Param('deviceId') deviceId: string,
    @Body() body: { commandType: string; commandData?: any },
  ) {
    return this.commandService.sendCommand(deviceId, body.commandType, body.commandData);
  }

  @Get(':deviceId')
  getCommands(@Param('deviceId') deviceId: string) {
    return this.commandService.getCommands(deviceId);
  }
}
